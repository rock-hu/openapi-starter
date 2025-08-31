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
-- Name: picklist_status_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE picklist_status_history (
    picklist_id character varying(20) NOT NULL,
    change_date timestamp with time zone NOT NULL,
    change_user_login_id character varying(255),
    status_id character varying(20),
    status_id_to character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.picklist_status_history OWNER TO ofbiz;

--
-- Name: picklist_status_history pk_picklist_status_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status_history
    ADD CONSTRAINT pk_picklist_status_history PRIMARY KEY (picklist_id, change_date);


--
-- Name: pcklst_sthst_cul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_sthst_cul ON picklist_status_history USING btree (change_user_login_id);


--
-- Name: pcklst_sthst_fsi; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_sthst_fsi ON picklist_status_history USING btree (status_id);


--
-- Name: pcklst_sthst_pklt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_sthst_pklt ON picklist_status_history USING btree (picklist_id);


--
-- Name: pcklst_sthst_svc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_sthst_svc ON picklist_status_history USING btree (status_id, status_id_to);


--
-- Name: pcklst_sthst_tsi; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_sthst_tsi ON picklist_status_history USING btree (status_id_to);


--
-- Name: pckt_sts_hsr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pckt_sts_hsr_txcrs ON picklist_status_history USING btree (created_tx_stamp);


--
-- Name: pckt_sts_hsr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pckt_sts_hsr_txstp ON picklist_status_history USING btree (last_updated_tx_stamp);


--
-- Name: picklist_status_history pcklst_sthst_cul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status_history
    ADD CONSTRAINT pcklst_sthst_cul FOREIGN KEY (change_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: picklist_status_history pcklst_sthst_fsi; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status_history
    ADD CONSTRAINT pcklst_sthst_fsi FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: picklist_status_history pcklst_sthst_pklt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status_history
    ADD CONSTRAINT pcklst_sthst_pklt FOREIGN KEY (picklist_id) REFERENCES picklist(picklist_id);


--
-- Name: picklist_status_history pcklst_sthst_svc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status_history
    ADD CONSTRAINT pcklst_sthst_svc FOREIGN KEY (status_id, status_id_to) REFERENCES status_valid_change(status_id, status_id_to);


--
-- Name: picklist_status_history pcklst_sthst_tsi; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_status_history
    ADD CONSTRAINT pcklst_sthst_tsi FOREIGN KEY (status_id_to) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

