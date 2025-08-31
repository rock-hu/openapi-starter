--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: picklist_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE picklist_role (
    picklist_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.picklist_role OWNER TO ofbiz;

--
-- Name: picklist_role pk_picklist_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_role
    ADD CONSTRAINT pk_picklist_role PRIMARY KEY (picklist_id, party_id, role_type_id, from_date);


--
-- Name: pcklst_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_rl_txcrts ON picklist_role USING btree (created_tx_stamp);


--
-- Name: pcklst_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_rl_txstmp ON picklist_role USING btree (last_updated_tx_stamp);


--
-- Name: pcklst_rle_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_rle_cbul ON picklist_role USING btree (created_by_user_login);


--
-- Name: pcklst_rle_lmul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_rle_lmul ON picklist_role USING btree (last_modified_by_user_login);


--
-- Name: pcklst_rle_pklt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_rle_pklt ON picklist_role USING btree (picklist_id);


--
-- Name: pcklst_rle_prle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_rle_prle ON picklist_role USING btree (party_id, role_type_id);


--
-- Name: picklist_role pcklst_rle_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_role
    ADD CONSTRAINT pcklst_rle_cbul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: picklist_role pcklst_rle_lmul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_role
    ADD CONSTRAINT pcklst_rle_lmul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: picklist_role pcklst_rle_pklt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_role
    ADD CONSTRAINT pcklst_rle_pklt FOREIGN KEY (picklist_id) REFERENCES picklist(picklist_id);


--
-- Name: picklist_role pcklst_rle_prle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_role
    ADD CONSTRAINT pcklst_rle_prle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

