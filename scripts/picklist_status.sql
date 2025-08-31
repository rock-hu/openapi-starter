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
-- Name: picklist_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE picklist_status (
    picklist_id character varying(20) NOT NULL,
    status_date timestamp with time zone NOT NULL,
    change_by_user_login_id character varying(255),
    status_id character varying(20),
    status_id_to character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.picklist_status OWNER TO ofbiz;

--
-- Name: picklist_status pk_picklist_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status
    ADD CONSTRAINT pk_picklist_status PRIMARY KEY (picklist_id, status_date);


--
-- Name: pcklst_stst_cul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_stst_cul ON picklist_status USING btree (change_by_user_login_id);


--
-- Name: pcklst_stst_fsi; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_stst_fsi ON picklist_status USING btree (status_id);


--
-- Name: pcklst_stst_pklt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_stst_pklt ON picklist_status USING btree (picklist_id);


--
-- Name: pcklst_stst_tsi; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_stst_tsi ON picklist_status USING btree (status_id_to);


--
-- Name: pcklst_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_stts_txcrts ON picklist_status USING btree (created_tx_stamp);


--
-- Name: pcklst_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_stts_txstmp ON picklist_status USING btree (last_updated_tx_stamp);


--
-- Name: picklist_status pcklst_stst_cul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status
    ADD CONSTRAINT pcklst_stst_cul FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: picklist_status pcklst_stst_fsi; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status
    ADD CONSTRAINT pcklst_stst_fsi FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: picklist_status pcklst_stst_pklt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status
    ADD CONSTRAINT pcklst_stst_pklt FOREIGN KEY (picklist_id) REFERENCES picklist(picklist_id);


--
-- Name: picklist_status pcklst_stst_tsi; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status
    ADD CONSTRAINT pcklst_stst_tsi FOREIGN KEY (status_id_to) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

