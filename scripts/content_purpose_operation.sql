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
-- Name: content_purpose_operation; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_purpose_operation (
    content_purpose_type_id character varying(20) NOT NULL,
    content_operation_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    status_id character varying(20) NOT NULL,
    privilege_enum_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_purpose_operation OWNER TO ofbiz;

--
-- Name: content_purpose_operation pk_content_purpose_operation; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose_operation
    ADD CONSTRAINT pk_content_purpose_operation PRIMARY KEY (content_purpose_type_id, content_operation_id, role_type_id, status_id, privilege_enum_id);


--
-- Name: cntt_prs_opn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_prs_opn_txcrs ON content_purpose_operation USING btree (created_tx_stamp);


--
-- Name: cntt_prs_opn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_prs_opn_txstp ON content_purpose_operation USING btree (last_updated_tx_stamp);


--
-- Name: content_pro_oper; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_pro_oper ON content_purpose_operation USING btree (content_operation_id);


--
-- Name: content_pro_pei; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_pro_pei ON content_purpose_operation USING btree (privilege_enum_id);


--
-- Name: content_pro_rlt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_pro_rlt ON content_purpose_operation USING btree (role_type_id);


--
-- Name: content_pro_sti; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_pro_sti ON content_purpose_operation USING btree (status_id);


--
-- Name: content_pro_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_pro_type ON content_purpose_operation USING btree (content_purpose_type_id);


--
-- Name: content_purpose_operation content_pro_oper; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose_operation
    ADD CONSTRAINT content_pro_oper FOREIGN KEY (content_operation_id) REFERENCES content_operation(content_operation_id);


--
-- Name: content_purpose_operation content_pro_pei; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose_operation
    ADD CONSTRAINT content_pro_pei FOREIGN KEY (privilege_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: content_purpose_operation content_pro_rlt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose_operation
    ADD CONSTRAINT content_pro_rlt FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: content_purpose_operation content_pro_sti; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose_operation
    ADD CONSTRAINT content_pro_sti FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: content_purpose_operation content_pro_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose_operation
    ADD CONSTRAINT content_pro_type FOREIGN KEY (content_purpose_type_id) REFERENCES content_purpose_type(content_purpose_type_id);


--
-- PostgreSQL database dump complete
--

